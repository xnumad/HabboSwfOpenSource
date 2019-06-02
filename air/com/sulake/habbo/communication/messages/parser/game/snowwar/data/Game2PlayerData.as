//com.sulake.habbo.communication.messages.parser.game.snowwar.data.Game2PlayerData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2PlayerData implements IDisposable {

        private var _referenceId:int;
        private var _userName:String;
        private var _figureString:String;
        private var _gender:String;
        private var _teamId:int;
        private var _isDisposed:Boolean;

        public function Game2PlayerData();

        public function dispose():void;

        public function get disposed():Boolean;

        public function parse(k:IMessageDataWrapper):void;

        public function toString():String;

        public function get referenceId():int;

        public function get userName():String;

        public function get figureString():String;

        public function get gender():String;

        public function get teamId():int;

        public function get isDisposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

