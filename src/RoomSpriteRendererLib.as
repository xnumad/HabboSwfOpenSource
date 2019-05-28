package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomRendererFactoryBootstrap;
    import com.sulake.iid.IIDRoomRendererFactory;
    import binaryData.RoomSpriteRendererLib_manifest;

    public class RoomSpriteRendererLib extends SimpleApplication 
    {
        public static var manifest:Class = RoomSpriteRendererLib_manifest;
        public static var requiredClasses:Array = new Array(RoomRendererFactoryBootstrap, IIDRoomRendererFactory);
    }
}
