package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboNotificationsBootstrap;
    import com.sulake.iid.IIDHabboNotifications;
    import images.*;
    import binaryData.*;

    public class HabboNotificationsCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboNotificationsCom_manifest;
        public static var habbo_notifications_config_xml:Class = HabboNotificationsCom_habbo_notifications_config_xml;
        public static var if_icon_temp_png:Class = HabboNotificationsCom_if_icon_temp_png;
        public static var if_icon_hc_png:Class = HabboNotificationsCom_if_icon_hc_png;
        public static var if_icon_vip_png:Class = HabboNotificationsCom_if_icon_vip_png;
        public static var if_icon_recycler_png:Class = HabboNotificationsCom_if_icon_recycler_png;
        public static var if_icon_friend_bg_blue_png:Class = HabboNotificationsCom_if_icon_friend_bg_blue_png;
        public static var if_icon_duckets_png:Class = HabboNotificationsCom_if_icon_duckets_png;
        public static var if_icon_loyalty_png:Class = HabboNotificationsCom_if_icon_loyalty_png;
        public static var if_icon_diamond_png:Class = HabboNotificationsCom_if_icon_diamond_png;
        public static var motd_notification_xml:Class = HabboNotificationsCom_motd_notification_xml;
        public static var motd_notification_item_xml:Class = HabboNotificationsCom_motd_notification_item_xml;
        public static var layout_notification_xml:Class = HabboNotificationsCom_layout_notification_xml;
        public static var layout_notifications_browser_xml:Class = HabboNotificationsCom_layout_notifications_browser_xml;
        public static var club_gift_notification_xml:Class = HabboNotificationsCom_club_gift_notification_xml;
        public static var safety_locked_notification_xml:Class = HabboNotificationsCom_safety_locked_notification_xml;
        public static var layout_notification_popup_xml:Class = HabboNotificationsCom_layout_notification_popup_xml;
        public static var requiredClasses:Array = new Array(HabboNotificationsBootstrap, IIDHabboNotifications);
    }
}
