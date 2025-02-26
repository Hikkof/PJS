class Player
{
    constructor(scene, x, y)
    {
        this.scene = scene;
        
        this.sprite = this.scene.physics.add.sprite(x, y, 'player');
        this.sprite.isDed = false;

        this.sprite.setCollideWorldBounds(true);
        this.sprite.body.onWorldBounds=true;

        this.scene.cameras.main.setBounds(0, 0, this.scene.map.widthInPixels, this.scene.map.heightInPixels).startFollow(this.sprite);

        this.collider = this.scene.physics.add.collider(this.sprite, this.scene.platform);
    }


    collideWith(gameObject)
    {
        this.collider = this.scene.physics.add.collider(this.sprite, gameObject);

        return this;
    }


    reFollowPlayer()
    {
        this.scene.physics.world.bounds.setPosition(this.scene.cameras.main.worldView.x, 0);

        if (this.sprite.body.position.x + this.sprite.body.width / 2 > this.scene.cameras.main.midPoint.x && !this.scene.cameras.main._follow)
        {
            this.scene.cameras.main.startFollow(this.sprite);
        }
    }


   update(input)
    {
        if (input.left.isDown && !this.sprite.isDed)
        {
            this.sprite.setVelocityX(-125).setFlipX(true);
            this.sprite.body.onFloor() && this.sprite.play('run', true);
            this.scene.cameras.main.stopFollow(this.sprite);
        }
        else if (input.right.isDown && !this.sprite.isDed)
        {
            this.sprite.setVelocityX(125).setFlipX(false);
            this.sprite.body.onFloor() && this.sprite.play('run', true);
            this.reFollowPlayer();
        }
        else if (!this.sprite.isDed)
        {
            this.sprite.setVelocityX(0);
            this.sprite.body.onFloor() && this.sprite.play('idle', true);
        }
        if (input.space.isDown && this.sprite.body.onFloor() && !this.sprite.isDed)
        {
            this.sprite.setVelocityY(-265);
            this.sprite.play('jump', true);
        }
    }


    die()
    {
        this.sprite.isDed = true;
        this.sprite.setVelocity(0, -265);
        this.sprite.play('die', true);
        this.sprite.setCollideWorldBounds(false);
    }
}


export default Player;