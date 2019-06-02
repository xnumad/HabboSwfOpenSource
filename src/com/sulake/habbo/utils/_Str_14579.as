package com.sulake.habbo.utils
{
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.habbo.window.IHabboWindowManager;

    public class _Str_14579 
    {


        public static function isPerkAllowed(k:ISessionDataManager, _arg_2:IHabboWindowManager, _arg_3:String):Boolean
        {
            if (k.isPerkAllowed(_arg_3))
            {
                return true;
            }
            var _local_4:String = k.getPerkErrorMessage(_arg_3);
            _arg_2.simpleAlert("${perkmissing.title}", "${perkmissing.caption}", (("${" + _local_4) + "}"));
            return false;
        }
    }
}
