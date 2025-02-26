import { Game } from './scenes/Game.js';


var config =
{
    type: Phaser.AUTO,
    width: 400,
    height: 240,
    backgroundColor: 0xFFFFAC,
    title: 'mario',
    description: '',
    parent: 'game-container',
    pixelArt: true,
    physics:
    {
        default: 'arcade',
        arcade:
        {
            gravity: { y: 500 },
            debug: false
        }
    },
    scene:
    [
        Game
    ],
    scale:
    {
        mode: Phaser.Scale.FIT,
        autoCenter: Phaser.Scale.CENTER_BOTH
    }
}


new Phaser.Game(config);
            