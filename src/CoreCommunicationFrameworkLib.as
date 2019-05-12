package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.CoreCommunicationManagerBootstrap;
    import com.sulake.iid.IIDCoreCommunicationManager;
    import binaryData.*;

    public class CoreCommunicationFrameworkLib extends SimpleApplication 
    {
        public static var manifest:Class = _Str_15174;
        public static var requiredClasses:Array = new Array(CoreCommunicationManagerBootstrap, IIDCoreCommunicationManager);
    }
}
