export default scene =>
{
    scene.anims.create({key: 'run', frames: scene.anims.generateFrameNames('player', {prefix: 'mario_',start: 1,end: 3,}), frameRate: 10,repeat: -1});

    scene.anims.create({key: 'idle', frames: [{ key: 'player', frame: 'mario_0' }], frameRate: 10});

    scene.anims.create({key: 'jump', frames: [{ key: 'player', frame: 'mario_4' }], frameRate: 10});

    scene.anims.create({key: 'die', frames: [{ key: 'player', frame: 'mario_5' }], frameRate: 10});
};