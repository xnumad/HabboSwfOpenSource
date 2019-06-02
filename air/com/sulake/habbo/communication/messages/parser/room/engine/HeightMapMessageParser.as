//com.sulake.habbo.communication.messages.parser.room.engine.HeightMapMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import __AS3__.vec.Vector;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class HeightMapMessageParser implements IMessageParser {

        private static const STACKING_BLOCKED:int;
        private static const HEIGHT_MASK:int;

        private var _data:Vector.<int>;
        private var _width:int;
        private var _height:int;

        public function HeightMapMessageParser();

        public static function decodeTileHeight(k:int):Number;

        public static function decodeIsStackingBlocked(k:int):Boolean;

        public static function decodeIsRoomTile(k:int):Boolean;


        public function get width():int;

        public function get height():int;

        public function getTileHeight(k:int, _arg_2:int):Number;

        public function getStackingBlocked(k:int, _arg_2:int):Boolean;

        public function isRoomTile(k:int, _arg_2:int):Boolean;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

