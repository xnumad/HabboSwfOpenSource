package com.sulake.habbo.toolbar
{
    import flash.utils.Dictionary;

    public class HabboToolbarIconEnum 
    {
        public static const HELP:String = "HTIE_ICON_HELP";
        public static const NAVIGATOR:String = "HTIE_ICON_NAVIGATOR";
        public static const CATALOGUE:String = "HTIE_ICON_CATALOGUE";
        public static const INVENTORY:String = "HTIE_ICON_INVENTORY";
        public static const QUESTS:String = "HTIE_ICON_QUESTS";
        public static const ACHIEVEMENTS:String = "HTIE_ICON_ACHIEVEMENTS";
        public static const MEMENU:String = "HTIE_ICON_MEMENU";
        public static const GAMES:String = "HTIE_ICON_GAMES";
        public static const STORIES:String = "HTIE_ICON_STORIES";
        public static const RECEPTION:String = "HTIE_ICON_RECEPTION";
        public static const HOME:String = "HTIE_ICON_HOME";
        public static const GUIDE:String = "HTIE_ICON_GUIDE";
        public static const BUILDER:String = "HTIE_ICON_BUILDER";
        public static const CAMERA:String = "HTIE_ICON_CAMERA";
        public static const ROOMINFO:String = "HTIE_ICON_ROOMINFO";
        public static const EXT_GROUP:String = "HTIE_EXT_GROUP";
        public static const NAVIGATOR_ME_TAB:String = "HTIE_ICON_NAVIGATOR_ME_TAB";
		public static const MODTOOL:String = "HTIE_ICON_MODTOOL";
        private static const _TOOLBAR_NAMES:Dictionary = new Dictionary();

        {
            _TOOLBAR_NAMES[HELP] = "HELP";
            _TOOLBAR_NAMES[NAVIGATOR] = "NAVIGATOR";
            _TOOLBAR_NAMES[CATALOGUE] = "CATALOGUE";
            _TOOLBAR_NAMES[INVENTORY] = "INVENTORY";
            _TOOLBAR_NAMES[QUESTS] = "QUESTS";
            _TOOLBAR_NAMES[ACHIEVEMENTS] = "ACHIEVEMENTS";
            _TOOLBAR_NAMES[MEMENU] = "MEMENU";
            _TOOLBAR_NAMES[GAMES] = "GAMES";
            _TOOLBAR_NAMES[STORIES] = "STORIES";
            _TOOLBAR_NAMES[RECEPTION] = "RECEPTION";
            _TOOLBAR_NAMES[HOME] = "HOME";
            _TOOLBAR_NAMES[GUIDE] = "GUIDE";
            _TOOLBAR_NAMES[BUILDER] = "BUILDER";
            _TOOLBAR_NAMES[CAMERA] = "CAMERA";
			_TOOLBAR_NAMES[MODTOOL] = "MODTOOL";
        }


        public static function getIconName(k:String):String
        {
            return _TOOLBAR_NAMES[k];
        }
    }
}
