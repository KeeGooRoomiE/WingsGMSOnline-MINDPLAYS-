/// @description Insert description here


// Тут находим координаты в комнате между героем и курсором.
if (target != noone)
{

	var cameraX = mean(target.x, x);
	var cameraY = mean(target.y, y);

	// Если курсор справа от персонажа.
	if (cameraX > target.x)
	{
	    // Проверяем, не дальше ли курсор от героя, чем допустимое значение переменной maxCamDistance.
	    var camMaxX = (target.x + maxCamDistance)
	    //Если дальше, то ограничиваем. 
	    if (cameraX > camMaxX)
	    {
	        cameraX = camMaxX
	    }
	}
	// Если курсор слева.
	else
	{
	    // По аналогии выше.
	    var camMaxX = (target.x - maxCamDistance)
	    if (cameraX < camMaxX)
	    {
	        cameraX = camMaxX
	    }
	}

	// То-же самое, только для Y оси. 
	if (cameraY > target.y)
	{
	    var camMaxY = (target.y + maxCamDistance)
	    if (cameraY > camMaxY)
	    {
	        cameraY = camMaxY
	    }
	}
	else
	{
	    var camMaxY = (target.y - maxCamDistance)
	    if (cameraY < camMaxY)
	    {
	        cameraY = camMaxY
	    }
	}


	// Тут плавная камера. 
	x = lerp(x, cameraX, camSensitivity);
	y = lerp(y, cameraY, camSensitivity);

}

//x = global.target_x;
//y = global.target_y;

