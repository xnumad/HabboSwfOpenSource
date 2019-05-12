package snowwar._Str_267
{
    import com.sulake.habbo.communication.messages.parser.game.score._Str_3326;
    import snowwar.SnowWarEngine;
    import snowwar._Str_477._SafeStr_3776;
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _SafeStr_4664 extends LeaderboardTable 
    {
        private var _SafeStr_22055:_Str_3326;

        public function _SafeStr_4664(k:SnowWarEngine)
        {
            super(k);
            _SafeStr_22049 = (_SafeStr_22049 - 1);
        }

        override public function dispose():void
        {
            super.dispose();
            this._SafeStr_22055 = null;
        }

        override public function addEntries(k:Array, _arg_2:int):void
        {
            this._SafeStr_22055 = k.pop();
            super.addEntries(k, _arg_2);
        }

        override protected function getMessageComposer(k:int, _arg_2:int, _arg_3:int):IMessageComposer
        {
            return new _SafeStr_3776(k, _arg_2, _arg_3, _SafeStr_22049, _SafeStr_22050);
        }

        override public function getVisibleEntries():Array
        {
            var k:Array = super.getVisibleEntries();
            if (this._SafeStr_22055)
            {
                k.push(this._SafeStr_22055);
            }
            return k;
        }

        override protected function initializeList():void
        {
            _SafeStr_22048 = 0;
        }
    }
}
