class Flag
{
    constructor(scene)
    {
        this.scene = scene;

        const flagObject = scene.map.getObjectLayer('flag').objects[0];
        const flagCoordinates = scene.tileset.texCoordinates[449]; 
        const flagRoot = scene.platform.getTileAt(13, 18);
    }
}


export default Flag;