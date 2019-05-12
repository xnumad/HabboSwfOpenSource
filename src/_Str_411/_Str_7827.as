package _Str_411
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_7827 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_7827()
        {
            this._Str_594 = [];
            super();
        }

        public function dispose():void
        {
            this._Str_594 = null;
        }

        public function getMessageArray():Array
        {
            return this._Str_594;
        }
    }
}
