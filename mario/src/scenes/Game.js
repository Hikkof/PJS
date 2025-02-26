import Player from '../Objects/Player.js'
import Flag from '../Objects/Flag.js'
import generateAnimations from '../../config/animations.js'


export class Game extends Phaser.Scene
{
    constructor()
    {
        super('Game');
    }


    preload()
    {
        this.load.image('tiles', '/assets/tiles.png');
        this.load.tilemapTiledJSON('untitled', '/assets/map.json');
        
        this.load.atlas('player', 'assets/mario.png', 'assets/mario.json');
        
        this.load.on('complete', () =>
        {
            generateAnimations(this);
        });
        
    }


    create()
    {
        this.map = this.make.tilemap({ key: 'untitled' });
        this.tileset = this.map.addTilesetImage('transparent', 'tiles');

        this.backLayer = this.map.createLayer("Background", this.tileset);

        this.groundLayer = this.map.createLayer("Foreground", this.tileset);
        this.groundLayer.setCollisionByExclusion(-1);

        this.player = new Player(this, 200, 200).collideWith(this.groundLayer);

        this.inputs = this.input.keyboard.createCursorKeys();
    }


    update()
    {
        this.player.update(this.inputs);

        this.physics.world.on('worldbounds', (body, up, down, left, right)=>
        {
            if(down)
            {
                this.player.die();
            }
        });
    }
}