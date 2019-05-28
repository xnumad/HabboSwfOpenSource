package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.CoreCommunicationManagerBootstrap;
    import com.sulake.iid.IIDCoreCommunicationManager;
    import binaryData.*;

    public class CoreCommunicationFrameworkLib extends SimpleApplication 
    {
        public static var manifest:Class = CoreCommunicationFrameworkLib_manifest;
        public static var requiredClasses:Array = new Array(CoreCommunicationManagerBootstrap, IIDCoreCommunicationManager);
    }
}
