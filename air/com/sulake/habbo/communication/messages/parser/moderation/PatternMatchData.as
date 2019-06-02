//com.sulake.habbo.communication.messages.parser.moderation.PatternMatchData

package com.sulake.habbo.communication.messages.parser.moderation{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PatternMatchData implements IDisposable {

        private var _pattern:String;
        private var _startIndex:int;
        private var _endIndex:int;
        private var _isDisposed:Boolean;

        public function PatternMatchData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get pattern():String;

        public function get startIndex():int;

        public function get endIndex():int;


    }
}//package com.sulake.habbo.communication.messages.parser.moderation

