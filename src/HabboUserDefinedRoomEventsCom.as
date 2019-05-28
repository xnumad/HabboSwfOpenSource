package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboUserDefinedRoomEventsBootstrap;
    import com.sulake.iid.IIDHabboUserDefinedRoomEvents;
    import binaryData.*;
    import images.*;

    public class HabboUserDefinedRoomEventsCom extends SimpleApplication 
    {
        public static var icon_action_png:Class = HabboUserDefinedRoomEventsCom_icon_action_png;
        public static var icon_condition_png:Class = HabboUserDefinedRoomEventsCom_icon_condition_png;
        public static var icon_trigger_png:Class = HabboUserDefinedRoomEventsCom_icon_trigger_png;
        public static var move_0_png:Class = HabboUserDefinedRoomEventsCom_move_0_png;
        public static var move_2_png:Class = HabboUserDefinedRoomEventsCom_move_2_png;
        public static var move_4_png:Class = HabboUserDefinedRoomEventsCom_move_4_png;
        public static var move_6_png:Class = HabboUserDefinedRoomEventsCom_move_6_png;
        public static var move_diag_png:Class = HabboUserDefinedRoomEventsCom_move_diag_png;
        public static var move_rnd_png:Class = HabboUserDefinedRoomEventsCom_move_rnd_png;
        public static var move_vrt_png:Class = HabboUserDefinedRoomEventsCom_move_vrt_png;
        public static var rotate_ccw_png:Class = HabboUserDefinedRoomEventsCom_rotate_ccw_png;
        public static var rotate_cw_png:Class = HabboUserDefinedRoomEventsCom_rotate_cw_png;
        public static var slider_bg_png:Class = HabboUserDefinedRoomEventsCom_slider_bg_png;
        public static var slider_obj_png:Class = HabboUserDefinedRoomEventsCom_slider_obj_png;
        public static var manifest:Class = HabboUserDefinedRoomEventsCom_manifest;
        public static var ude_main_xml:Class = HabboUserDefinedRoomEventsCom_ude_main_xml;
        public static var ude_help_xml:Class = HabboUserDefinedRoomEventsCom_ude_help_xml;
        public static var ude_slider_xml:Class = HabboUserDefinedRoomEventsCom_ude_slider_xml;
        public static var ude_trigger_inputs_0_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_0_xml;
        public static var ude_trigger_inputs_3_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_3_xml;
        public static var ude_trigger_inputs_6_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_6_xml;
        public static var ude_trigger_inputs_7_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_7_xml;
        public static var ude_trigger_inputs_12_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_12_xml;
        public static var ude_trigger_inputs_10_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_10_xml;
        public static var ude_trigger_inputs_13_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_13_xml;
        public static var ude_trigger_inputs_14_xml:Class = HabboUserDefinedRoomEventsCom_ude_trigger_inputs_14_xml;
        public static var ude_action_inputs_3_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_3_xml;
        public static var ude_action_inputs_4_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_4_xml;
        public static var ude_action_inputs_6_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_6_xml;
        public static var ude_action_inputs_7_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_7_xml;
        public static var ude_action_inputs_9_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_9_xml;
        public static var ude_action_inputs_13_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_13_xml;
        public static var ude_action_inputs_14_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_14_xml;
        public static var ude_action_inputs_16_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_16_xml;
        public static var ude_action_inputs_17_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_17_xml;
        public static var ude_action_inputs_17_reward_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_17_reward_xml;
        public static var ude_action_inputs_19_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_19_xml;
        public static var ude_action_inputs_20_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_20_xml;
        public static var ude_action_inputs_21_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_21_xml;
        public static var ude_action_inputs_22_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_22_xml;
        public static var ude_action_inputs_23_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_23_xml;
        public static var ude_action_inputs_24_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_24_xml;
        public static var ude_action_inputs_25_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_25_xml;
        public static var ude_action_inputs_26_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_26_xml;
        public static var ude_action_inputs_27_xml:Class = HabboUserDefinedRoomEventsCom_ude_action_inputs_27_xml;
        public static var ude_condition_inputs_0_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_0_xml;
        public static var ude_condition_inputs_3_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_3_xml;
        public static var ude_condition_inputs_4_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_4_xml;
        public static var ude_condition_inputs_5_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_5_xml;
        public static var ude_condition_inputs_6_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_6_xml;
        public static var ude_condition_inputs_7_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_7_xml;
        public static var ude_condition_inputs_9_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_9_xml;
        public static var ude_condition_inputs_11_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_11_xml;
        public static var ude_condition_inputs_12_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_12_xml;
        public static var ude_condition_inputs_18_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_18_xml;
        public static var ude_condition_inputs_24_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_24_xml;
        public static var ude_condition_inputs_25_xml:Class = HabboUserDefinedRoomEventsCom_ude_condition_inputs_25_xml;
        public static var requiredClasses:Array = new Array(HabboUserDefinedRoomEventsBootstrap, IIDHabboUserDefinedRoomEvents);
    }
}
