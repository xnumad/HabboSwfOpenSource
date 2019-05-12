package com.sulake.habbo.ui.widget.infostand
{
    import flash.utils.Dictionary;

    public class CommandConfiguration 
    {
        private var _allCommandIds:Array;
        private var _enabledCommands:Dictionary;

        public function CommandConfiguration(k:Array, _arg_2:Array)
        {
            var _local_3:int;
            var _local_4:int;
            this._enabledCommands = new Dictionary();
            super();
            this._allCommandIds = k;
            while (_local_3 < _arg_2.length)
            {
                _local_4 = _arg_2[_local_3];
                this._enabledCommands[_local_4] = true;
                _local_3++;
            }
        }

        public function get _Str_22858():Array
        {
            return this._allCommandIds;
        }

        public function _Str_5065(k:int):Boolean
        {
            return !(this._enabledCommands[k] == null);
        }
    }
}
