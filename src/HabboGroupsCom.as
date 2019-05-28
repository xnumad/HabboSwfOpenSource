package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboGroupsManagerBootstrap;
    import com.sulake.iid.IIDHabboGroupsManager;
    import binaryData.*;
    import images.*;

    public class HabboGroupsCom extends SimpleApplication 
    {
        public static var manifest:Class = HabboGroupsCom_manifest;
        public static var group:Class = HabboGroupsCom_group;
        public static var guild_members_window:Class = HabboGroupsCom_guild_members_window;
        public static var group_entry:Class = HabboGroupsCom_group_entry;
        public static var member_entry:Class = HabboGroupsCom_member_entry;
        public static var group_info_window:Class = HabboGroupsCom_group_info_window;
        public static var group_management_window:Class = HabboGroupsCom_group_management_window;
        public static var new_extended_profile:Class = HabboGroupsCom_new_extended_profile;
        public static var club_required:Class = HabboGroupsCom_club_required;
        public static var group_created_window:Class = HabboGroupsCom_group_created_window;
        public static var group_room_info:Class = HabboGroupsCom_group_room_info;
        public static var no_groups:Class = HabboGroupsCom_no_groups;
        public static var badge_color_item:Class = HabboGroupsCom_badge_color_item;
        public static var badge_editor:Class = HabboGroupsCom_badge_editor;
        public static var badge_layer:Class = HabboGroupsCom_badge_layer;
        public static var badge_part_item:Class = HabboGroupsCom_badge_part_item;
        public static var color_chooser_bg:Class = HabboGroupsCom_color_chooser_bg;
        public static var color_chooser_fg:Class = HabboGroupsCom_color_chooser_fg;
        public static var color_chooser_selected:Class = HabboGroupsCom_color_chooser_selected;
        public static var part_preview_bg:Class = HabboGroupsCom_part_preview_bg;
        public static var position_grid:Class = HabboGroupsCom_position_grid;
        public static var position_picker:Class = HabboGroupsCom_position_picker;
        public static var badge_part_add:Class = HabboGroupsCom_badge_part_add;
        public static var badge_part_empty:Class = HabboGroupsCom_badge_part_empty;
        public static var badge_part_picker:Class = HabboGroupsCom_badge_part_picker;
        public static var requiredClasses:Array = new Array(HabboGroupsManagerBootstrap, IIDHabboGroupsManager);
    }
}
