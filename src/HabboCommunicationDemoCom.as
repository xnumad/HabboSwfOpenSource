package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboCommunicationDemoBootstrap;
    import binaryData.*;

    public class HabboCommunicationDemoCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboCommunicationDemoCom_manifest;
        public static var login_window:Class = HabboCommunicationDemoCom_login_window;
        public static var login_environment_list_item:Class = HabboCommunicationDemoCom_login_environment_list_item;
        public static var requiredClasses:Array = new Array(HabboCommunicationDemoBootstrap);
    }
}
