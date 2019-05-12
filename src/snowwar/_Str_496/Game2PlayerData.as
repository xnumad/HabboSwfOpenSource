package snowwar._Str_496
{
	import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class Game2PlayerData implements IDisposable 
    {
        private var _SafeStr_22185:int;
        private var _userName:String;
        private var _SafeStr_16162:String;
        private var _gender:String;
        private var _final:int;
        private var _disposed:Boolean = false;


        public function dispose():void
        {
            this._userName = null;
            this._SafeStr_16162 = null;
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function parse(k:IMessageDataWrapper):void
        {
            this._SafeStr_22185 = k.readInteger();
            this._userName = k.readString();
            this._SafeStr_16162 = k.readString();
            this._gender = k.readString();
            this._final = k.readInteger();
        }

        public function toString():String
        {
            return (("[Game Player] " + this._SafeStr_22185) + ": ") + this._userName;
        }

        public function get _SafeStr_22186():int
        {
            return this._SafeStr_22185;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get _SafeStr_9044():String
        {
            return this._SafeStr_16162;
        }

        public function get gender():String
        {
            return this._gender;
        }

        public function get final():int
        {
            return this._final;
        }

        public function get _SafeStr_22187():Boolean
        {
            return this._disposed;
        }
    }
}










