package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboCommunicationManagerBootstrap;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import binaryData.HabboCommunicationCom_manifest;

    public class HabboCommunicationCom extends SimpleApplication 
    {
        public static var requiredClasses:Array = new Array(HabboCommunicationManagerBootstrap, IIDHabboCommunicationManager);
        public static var manifest:Class = HabboCommunicationCom_manifest;
    }
}
