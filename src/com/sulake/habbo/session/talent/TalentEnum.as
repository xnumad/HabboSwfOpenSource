package com.sulake.habbo.session.talent
{
    public class TalentEnum 
    {
        public static const HELPER:String = "helper";
        public static const CITIZENSHIP:String = "citizenship";


        public static function get asArray():Array
        {
            return [HELPER, CITIZENSHIP];
        }
    }
}
