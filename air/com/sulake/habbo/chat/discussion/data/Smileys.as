//com.sulake.habbo.chat.discussion.data.Smileys

package com.sulake.habbo.chat.discussion.data{
    import com.sulake.core.utils.MapString;

    public class Smileys {

        private static var _gestures:MapString;

        public function Smileys();

        public static function parseSmileyGesture(k:String):String;

        private static function initGestures():void;


    }
}//package com.sulake.habbo.chat.discussion.data

