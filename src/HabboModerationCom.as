package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.ModerationManagerBootstrap;
    import com.sulake.iid.IIDHabboModeration;
    import binaryData.*;
    import images.*;

    public class HabboModerationCom extends SimpleApplication 
    {
        public static var manifest:Class = _Str_14549;
        public static var requiredClasses:Array = new Array(ModerationManagerBootstrap, IIDHabboModeration);
        public static var evidence_frame_xml:Class = _Str_12607;
        public static var issue_browser_xml:Class = _Str_14467;
        public static var modact_summary_xml:Class = _Str_14221;
        public static var send_msgs_xml:Class = _Str_13092;
        public static var start_panel_xml:Class = _Str_13329;
        public static var user_info_xml:Class = _Str_14902;
        public static var user_info_frame_xml:Class = _Str_14505;
        public static var issue_handler_xml:Class = _Str_12980;
        public static var roomtool_frame_xml:Class = _Str_15153;
        public static var roomvisits_frame_xml:Class = _Str_15000;
        public static var userclassification_frame_xml:Class = _Str_15256;
        public static var room_icon_png:Class = _Str_15821;
        public static var user_icon_png:Class = _Str_15363;
		public static var moderation_icon_xml:Class = ModerationIconXML;
		public static var moderation_m_icon_png:Class = ModerationMIconPng;
    }
}
