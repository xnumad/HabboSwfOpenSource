//com.sulake.habbo.communication.messages.parser.game.snowwar.data.GameLevelData

package com.sulake.habbo.communication.messages.parser.game.snowwar.data{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GameLevelData {

        private var _width:int;
        private var _height:int;
        private var _heightMap:String;
        private var _fuseObjects:Array;

        public function GameLevelData(k:IMessageDataWrapper);

        public function get width():int;

        public function get height():int;

        public function get heightMap():String;

        public function get fuseObjects():Array;

        public function parse(k:IMessageDataWrapper):void;


    }
}//package com.sulake.habbo.communication.messages.parser.game.snowwar.data

