package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3579 implements IDisposable 
    {
        private var _adId:int;
        private var _Str_21450:int;
        private var _Str_20782:String;
        private var _flatId:int;
        private var _Str_2629:int;
        private var _eventType:int;
        private var _eventName:String;
        private var _eventDescription:String;
        private var _creationTime:String;
        private var _Str_20383:Date;
        private var _disposed:Boolean;

        public function _Str_3579(k:IMessageDataWrapper)
        {
            this._adId = k.readInteger();
            this._Str_21450 = k.readInteger();
            this._Str_20782 = k.readString();
            this._flatId = k.readInteger();
            this._eventType = k.readInteger();
            this._eventName = k.readString();
            this._eventDescription = k.readString();
            var _local_2:int = k.readInteger();
            var _local_3:int = k.readInteger();
            var _local_4:Date = new Date();
            var _local_5:Number = _local_4.getTime();
            var _local_6:Number = ((_local_2 * 60) * 1000);
            _local_5 = (_local_5 - _local_6);
            var _local_7:Date = new Date(_local_5);
            this._creationTime = ((((((((_local_7.date + "-") + _local_7.month) + "-") + _local_7.fullYear) + " ") + _local_7.hours) + ":") + _local_7.minutes);
            var _local_8:Number = _local_4.getTime();
            var _local_9:Number = ((_local_3 * 60) * 1000);
            _local_8 = (_local_8 + _local_9);
            this._Str_20383 = new Date(_local_8);
            this._Str_2629 = k.readInteger();
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get adId():int
        {
            return this._adId;
        }

        public function get _Str_13361():int
        {
            return this._Str_21450;
        }

        public function get _Str_26367():String
        {
            return this._Str_20782;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get _Str_2712():int
        {
            return this._Str_2629;
        }

        public function get eventType():int
        {
            return this._eventType;
        }

        public function get eventName():String
        {
            return this._eventName;
        }

        public function get eventDescription():String
        {
            return this._eventDescription;
        }

        public function get creationTime():String
        {
            return this._creationTime;
        }

        public function get _Str_21519():Date
        {
            return this._Str_20383;
        }
    }
}
