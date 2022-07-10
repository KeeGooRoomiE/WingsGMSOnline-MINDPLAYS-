
// запрашивание библиотек
const server = require('http').createServer()
const io = require('socket.io')(server, { cors: { origin: '*' } });
// порт для запуска 
const port = 3001;


// прослушивание порта и возвращение ошибки
// в случае если порт занят
server.listen(port, (err) => {
    if (err) throw err
    console.log(`Listening on port ${port}`);
});

// массив игроков
var players = [];
// массив пуль
var bullets = [];
// уникальный айди клиента
var clientId = 0;
// уникальный айди пуль
var bulletId = 0;

// модель игрока
class Player {

    // конструктор класса
    constructor(data) {

        this.username = data.username;
        this.socket = data.socket;
        this.id = data.id;
        this.hp = data.hp
        this.x = data.x;
        this.y = data.y;
        this.direction = data.direction;        
        this.speed = data.speed;     
        this.canShot = data.canShot;   
    }

    // перевод в строку
    toString() {
        return JSON.stringify(this, this.replacer);
    }

    // замена если найден ключ 'socket' верни undefined
    replacer(key, value) {
        if (key == "socket") return undefined;
        else return value;
    }
}

// модель пули
class Bullet{

    // конструктор класса
    constructor(data) {
        this.bulletId = data.bulletId;
        this.owner = data.owner;
        this.x = data.x;
        this.y = data.y;
        this.direction = data.direction;        
        this.speed = data.speed;     
    }

    // перевод в строку
    toString() {
        return JSON.stringify(this);
    }

}

// запус сокетов
io.on('connection', (client) => {
    
    // создание уникальных айди
    var playerId = clientId++;
    // текущий игрок
    var player;

    // добавление игрока
    client.on('create_player', (data) => {

        // получение данных
        data = JSON.parse(data);

        // создание игрока
        player = new Player({
            socket: client,
            id: playerId,
            username: data.username,
            x: Math.floor(Math.random() * 700) + 60,
            y: Math.floor(Math.random() * 500) + 60,
            direction: 0,
            speed: 0,
            hp: 110,
            canShot: true,
        });

        // добавление в список игроков
        players.push(player);

        // Добавление пользователя для себя
        client.emit('create_player', player.toString());

        // Добавление для других пользователей
        client.broadcast.emit('create_player_other', player.toString());

        // Добавление всем остальным кроме себя
        for (let i in players) {
            if (players[i] !== player) {
                client.emit('create_player_other', players[i].toString());
            }
        }

        //test

        console.log(`Пользователь "${player.username}", с ID: ${player.id} создан!`);
    });


    // Создание пули
    client.on('create_bullet', (data) => {

        // получение данных
        data = JSON.parse(data);

        // прибавление айди
        bulletId++;

        // создание пули        
        var bullet = new Bullet({
            bulletId: bulletId,
            x: data.x,
            y: data.y,
            direction: data.direction,
            owner: data.owner,
            speed: data.speed,
        });

        // добавление пули в массив пуль
        bullets.push(bullet);

        // Добавление пользователя для себя
        client.emit('create_bullet', bullet.toString());

        // Добавление для других пользователей
        client.broadcast.emit('create_bullet', bullet.toString());

        console.log(`новая пуля с ID:"${bullet.bulletId}" создана!`);
    });

    // обновление позиций
    client.on('position_update', (data) => {

        // получение данных
        data = JSON.parse(data);

        player.x = data.x;
        player.y = data.y;
        player.direction = data.direction;
        player.speed = data.speed;
        player.canShot = data.canShot;

        client.broadcast.emit('position_update', player.toString());
    });

    // обновление пули
    client.on('bullet_update', (data) => {

        // получение данных
        data = JSON.parse(data);

        // пуля
        let bullet = null;

        // поиск пули
        for (let i in bullets) {
            if (bullets[i]['bulletId'] == data.bulletId) {
                bullet = bullets[i];
            }
        }

        // если пуля не найдена верни ошибку
        // если найдена тогда обнови координаты
        if(bullet !== null)
        {
            bullet.x = data.x;
            bullet.y = data.y;
            bullet.direction = data.direction;
            bullet.speed = data.speed;
            //client.emit('bullet_update', bullet.toString());
            client.broadcast.emit('bullet_update', bullet.toString());
            console.log(`Пуля с ID:"${bullet.bulletId}" обновила координаты.`);
        }
    
    });


    // удаление пули
    client.on('destroy_bullet', (data) => {
        // получение данных
        data = JSON.parse(data);
        // пуля
        let bullet = null;

        //поиск пули
        for (var i in bullets) {
            if (bullets[i]['bulletId'] == data.bulletId) {
                bullet = bullets[i];
                

                        // если пуля не найдена верни ошибку
                        // если найдена удали пулю
                if (bullet = null)
                {
                    //client.broadcast.emit('destroy_bullet', JSON.stringify({'error':true}));
                    console.log(`Пуля не найдена`,data);
                }
                else
                {
                    //client.broadcast.emit('destroy_bullet', JSON.stringify({'bulletId':bullet.bulletId}));
                    //console.log(`Пуля удалена "${bullet.bulletId}"`);
                    client.emit('destroy_bullet', JSON.stringify({'bulletId':bullets[i].bulletId}));
                    client.broadcast.emit('destroy_bullet', JSON.stringify({'bulletId':bullets[i].bulletId}));
                    console.log(`Пуля с ID:"${bullets[i].bulletId}" удалена.`);
                    bullets.splice(bullets.indexOf(bullets[i]), 1);
                }
                
            }
        }




    });

    // изменение здоровья игрока
    client.on('hp_update', (data) => {

        // получение данных
        data = JSON.parse(data);

        // обновление здоровья
        player.hp = data.hp;

        // отправка информаций остальным игрокам
        client.broadcast.emit('hp_update', JSON.stringify({id:player.id,hp:player.hp}));

        console.log(`Здоровья пользователя "${player.username}", с ID: ${player.id} равно: ${player.hp}.`);
    });

    // When a player closes the game or refresh the page, this event will be triggered
    client.on('disconnect', () => {

        if(player !== null)
        {

            
        // Tell everyone that we disconnected (ourself NOT included, because we already closed the game and we don't care)
        client.broadcast.emit('destroy_player', player.toString());

        //Remove player from list 
        players.splice(players.indexOf(player), 1);

        console.log(`Player "${player.username}", with ID: ${player.id} disconnected.`);

        }

    });

});