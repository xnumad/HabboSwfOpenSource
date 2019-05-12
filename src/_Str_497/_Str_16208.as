package _Str_497
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_16208 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_16208()
        {
            this._Str_594 = [];
            super();
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }

        public function dispose():void
        {
            this._Str_594 = [];
        }
    }
}
