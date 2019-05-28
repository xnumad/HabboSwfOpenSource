package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomManagerBootstrap;
    import com.sulake.iid.IIDRoomManager;
    import binaryData.RoomManagerLib_manifest;

    public class RoomManagerLib extends SimpleApplication 
    {
        public static var manifest:Class = RoomManagerLib_manifest;
        public static var requiredClasses:Array = new Array(RoomManagerBootstrap, IIDRoomManager);
    }
}
