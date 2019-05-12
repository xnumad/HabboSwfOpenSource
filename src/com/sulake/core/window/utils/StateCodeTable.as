package com.sulake.core.window.utils
{
    import com.sulake.core.window.enum.WindowState;
    import flash.utils.Dictionary;

    public class StateCodeTable 
    {
        public static function fillTables(dict:Dictionary, addTo:Dictionary=null):void
        {
            dict["default"] = WindowState.DEFAULT;
            dict["active"] = WindowState.ACTIVE;
            dict["focused"] = WindowState.FOCUSED;
            dict["hovering"] = WindowState.HOVERING;
            dict["selected"] = WindowState.SELECTED;
            dict["pressed"] = WindowState.PRESSED;
            dict["disabled"] = WindowState.DISABLED;
            dict["locked"] = WindowState.LOCKED;
            if (addTo != null)
            {
                for (var key:String in dict)
                {
                    addTo[dict[key]] = key;
                }
            }
        }
    }
}
