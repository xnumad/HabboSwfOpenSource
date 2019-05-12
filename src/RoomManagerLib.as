package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.RoomManagerBootstrap;
    import com.sulake.iid.IIDRoomManager;
    import binaryData.*;

    public class RoomManagerLib extends SimpleApplication 
    {
        public static var manifest:Class = _Str_15505;
        public static var requiredClasses:Array = new Array(RoomManagerBootstrap, IIDRoomManager);
    }
}
