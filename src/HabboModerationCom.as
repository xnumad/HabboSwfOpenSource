package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.ModerationManagerBootstrap;
    import com.sulake.iid.IIDHabboModeration;
    import binaryData.*;
    import images.*;

    public class HabboModerationCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboModerationCom_manifest;
        public static var requiredClasses:Array = new Array(ModerationManagerBootstrap, IIDHabboModeration);
        public static var evidence_frame_xml:Class = HabboModerationCom_evidence_frame_xml;
        public static var issue_browser_xml:Class = HabboModerationCom_issue_browser_xml;
        public static var modact_summary_xml:Class = HabboModerationCom_modact_summary_xml;
        public static var send_msgs_xml:Class = HabboModerationCom_send_msgs_xml;
        public static var start_panel_xml:Class = HabboModerationCom_start_panel_xml;
        public static var user_info_xml:Class = HabboModerationCom_user_info_xml;
        public static var user_info_frame_xml:Class = HabboModerationCom_user_info_frame_xml;
        public static var issue_handler_xml:Class = HabboModerationCom_issue_handler_xml;
        public static var roomtool_frame_xml:Class = HabboModerationCom_roomtool_frame_xml;
        public static var roomvisits_frame_xml:Class = HabboModerationCom_roomvisits_frame_xml;
        public static var userclassification_frame_xml:Class = HabboModerationCom_userclassification_frame_xml;
        public static var room_icon_png:Class = HabboModerationCom_room_icon_png;
        public static var user_icon_png:Class = HabboModerationCom_user_icon_png;
		public static var moderation_icon_xml:Class = ModerationIconXML;
		public static var moderation_m_icon_png:Class = ModerationMIconPng;
    }
}
