USE [GasStation]
GO
/****** Object:  StoredProcedure [dbo].[spGetLottery]    Script Date: 6/25/2017 4:04:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[spGetLottery]
	@startDate as Datetime,
	@endDate	as Datetime
AS
BEGIN
	
	SELECT  
			ROW_NUMBER() OVER(ORDER BY [Owner].id DESC) AS Row,
			[Owner].id,
			[Owner].name,
			[Owner].lastname, 
			[Owner].nationalCode, 
			[Owner].mobile,
			plate,
			Lottery.[month],
			Lottery.total as total
			
			

		FROM 

			Plate

			INNER JOIN Car				ON Car.plateId = Plate.id	
			INNER JOIN [Base.PlateType] ON [Base.PlateType].id = Plate.plateTypeId
			INNER JOIN [Base.CarColor]	ON [Base.CarColor].id = Car.carColorId
			INNER JOIN [Base.CarType]	ON [Base.CarType].id = Car.carTypeId
			INNER JOIN [Base.PlateCity] ON [Base.PlateCity].id = Plate.plateCityId
			INNER JOIN CarOwner			ON CarOwner.carId = Car.id
			INNER JOIN [Owner]			ON [Owner].id = CarOwner.ownerId
			INNER JOIN CarTag			ON CarTag.carId = Car.id
			INNER JOIN Tag				ON Tag.id = CarTag.tagId
			INNER JOIN Lottery			ON Lottery.ownerId = Owner.id
		

			WHERE 	
			
				(dbo.Lottery.startDate =  @startDate AND dbo.Lottery.endDate = @endDate)
			
			
			
			GROUP BY [Owner].id, [Owner].name, [owner].lastname, [Owner].nationalCode, [owner].mobile, plate,Lottery.[month], Lottery.total
			ORDER BY Lottery.total DESC
END
