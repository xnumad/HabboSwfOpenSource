//com.sulake.habbo.communication.messages.parser.room.engine.FloorHeightMapMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class FloorHeightMapMessageParser implements IMessageParser {

        private var _text:String;
        private var _heightMap:Array;
        private var _width:int;
        private var _height:int;
        private var _scale:Number = 0;
        private var _fixedWallsHeight:int;

        public function FloorHeightMapMessageParser();

        public function get width():int;

        public function get height():int;

        public function get fixedWallsHeight():int;

        public function get scale():Number;

        public function getTileHeight(k:int, _arg_2:int):int;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get text():String;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

