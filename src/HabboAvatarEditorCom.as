package 
{
    import mx.core.SimpleApplication;
    import com.sulake.bootstrap.HabboAvatarEditorManagerBootstrap;
    import com.sulake.iid.IIDHabboAvatarEditor;
    import binaryData.*;

    public class HabboAvatarEditorCom extends SimpleApplication 
    {
        public static var requiredClasses:Array = new Array(HabboAvatarEditorManagerBootstrap, IIDHabboAvatarEditor);
        public static var manifest:Class = HabboAvatarEditorCom_manifest;
        public static var AvatarEditor:Class = HabboAvatarEditorCom_AvatarEditor;
        public static var AvatarEditorFrame:Class = HabboAvatarEditorCom_AvatarEditorFrame;
        public static var AvatarEditorContent:Class = HabboAvatarEditorCom_AvatarEditorContent;
        public static var StripClubItemsInfo:Class = HabboAvatarEditorCom_StripClubItemsInfo;
        public static var Outfit:Class = HabboAvatarEditorCom_Outfit;
        public static var avatareditor_wardrobe_base:Class = HabboAvatarEditorCom_avatareditor_wardrobe_base;
        public static var avatar_editor_effect_griditem_xml:Class = HabboAvatarEditorCom_avatar_editor_effect_griditem_xml;
        public static var avatar_editor_name_change:Class = HabboAvatarEditorCom_avatar_editor_name_change;
        public static var avatar_editor_name_change_item:Class = HabboAvatarEditorCom_avatar_editor_name_change_item;
    }
}
