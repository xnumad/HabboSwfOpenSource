package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboNewNavigatorBootstrap;
    import com.sulake.iid.IIDHabboNewNavigator;
    import binaryData.*;

    public class HabboNewNavigatorCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboNewNavigatorCom_manifest;
        public static var navigator_frame_2_xml:Class = HabboNewNavigatorCom_navigator_frame_2_xml;
        public static var room_info_popup_bubble_xml:Class = HabboNewNavigatorCom_room_info_popup_bubble_xml;
        public static var property_xml:Class = HabboNewNavigatorCom_property_xml;
        public static var tag_xml:Class = HabboNewNavigatorCom_tag_xml;
        public static var requiredClasses:Array = new Array(HabboNewNavigatorBootstrap, IIDHabboNewNavigator);
    }
}
