package com.sulake.habbo.help.enum
{
    import flash.events.Event;

    public class HabboHelpTutorialEvent extends Event 
    {
        public static const HHTPNUFWE_AVATAR_TUTORIAL_START:String = "HHTPNUFWE_AVATAR_TUTORIAL_START";
        public static const HHTPNUFWE_LIGHT_CLOTHES_ICON:String = "HHTPNUFWE_LIGHT_CLOTHES_ICON";
        public static const HHTE_DONE_AVATAR_EDITOR_OPENING:String = "HHTE_DONE_AVATAR_EDITOR_OPENING";
        public static const HHTE_DONE_AVATAR_EDITOR_CLOSING:String = "HHTE_DONE_AVATAR_EDITOR_CLOSING";

        public function HabboHelpTutorialEvent(k:String, _arg_2:Boolean=false, _arg_3:Boolean=false)
        {
            super(k, _arg_2, _arg_3);
        }
    }
}
