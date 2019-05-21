package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomRendererFactoryBootstrap;
    import com.sulake.iid.IIDRoomRendererFactory;
    import binaryData._Str_14655;

    public class RoomSpriteRendererLib extends SimpleApplication 
    {
        public static var manifest:Class = _Str_14655;
        public static var requiredClasses:Array = new Array(RoomRendererFactoryBootstrap, IIDRoomRendererFactory);
    }
}
