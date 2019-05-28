package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboMessengerBootstrap;
    import com.sulake.iid.IIDHabboMessenger;
    import images.*;
    import binaryData.*;

    public class HabboMessengerCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboMessengerCom_manifest;
        public static var close_png:Class = HabboMessengerCom_close_png;
        public static var convo_bg_png:Class = HabboMessengerCom_convo_bg_png;
        public static var follow_friend_png:Class = HabboMessengerCom_follow_friend_png;
        public static var minimail_png:Class = HabboMessengerCom_minimail_png;
        public static var next_png:Class = HabboMessengerCom_next_png;
        public static var prev_png:Class = HabboMessengerCom_prev_png;
        public static var resize_png:Class = HabboMessengerCom_resize_png;
        public static var tab_bg_hilite_png:Class = HabboMessengerCom_tab_bg_hilite_png;
        public static var tab_bg_next_png:Class = HabboMessengerCom_tab_bg_next_png;
        public static var tab_bg_sel_png:Class = HabboMessengerCom_tab_bg_sel_png;
        public static var tab_bg_unsel_png:Class = HabboMessengerCom_tab_bg_unsel_png;
        public static var main_window_xml:Class = HabboMessengerCom_main_window_xml;
        public static var msg_entry_xml:Class = HabboMessengerCom_msg_entry_xml;
        public static var tab_entry_xml:Class = HabboMessengerCom_tab_entry_xml;
        public static var messenger_xml:Class = HabboMessengerCom_messenger_xml;
        public static var requiredClasses:Array = new Array(HabboMessengerBootstrap, IIDHabboMessenger);
    }
}
