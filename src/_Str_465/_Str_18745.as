package _Str_465
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_18745 implements IMessageComposer 
    {
        private var _Str_594:Array;

        public function _Str_18745()
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
