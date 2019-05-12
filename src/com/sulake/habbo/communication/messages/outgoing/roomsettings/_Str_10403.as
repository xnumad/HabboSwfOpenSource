package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class _Str_10403 implements IMessageComposer, IDisposable 
    {
        private var _Str_2156:Array;

        public function _Str_10403(k:_Str_6251)
        {
            var _local_2:Array;
            var _local_3:String;
            var _local_4:String;
            this._Str_2156 = new Array();
            super();
            this._Str_2156.push(k.roomId);
            this._Str_2156.push(k.name);
            this._Str_2156.push(k.description);
            this._Str_2156.push(k._Str_2738);
            this._Str_2156.push(((k.password !== null) ? k.password : ""));
            this._Str_2156.push(k._Str_5552);
            this._Str_2156.push(k._Str_2712);
            if (k.tags)
            {
                _local_2 = [];
                for each (_local_3 in k.tags)
                {
                    if (((_local_3) && (!(_local_3 === ""))))
                    {
                        _local_2.push(_local_3);
                    }
                }
                this._Str_2156.push(_local_2.length);
                for each (_local_4 in _local_2)
                {
                    this._Str_2156.push(_local_4);
                }
            }
            else
            {
                this._Str_2156.push(0);
            }
            this._Str_2156.push(k._Str_3827);
            this._Str_2156.push(k._Str_5667);
            this._Str_2156.push(k._Str_7595);
            this._Str_2156.push(k._Str_7273);
            this._Str_2156.push(k._Str_7455);
            this._Str_2156.push(k._Str_5962);
            this._Str_2156.push(k._Str_6205);
            this._Str_2156.push(k._Str_7688);
            this._Str_2156.push(k._Str_6332);
            this._Str_2156.push(k._Str_7772);
            this._Str_2156.push(k._Str_18654);
            this._Str_2156.push(k._Str_16726);
            this._Str_2156.push(k._Str_17830);
            this._Str_2156.push(k._Str_18410);
            this._Str_2156.push(k._Str_16006);
            this._Str_2156.push(k._Str_18547);
        }

        public function getMessageArray():Array
        {
            return this._Str_2156;
        }

        public function dispose():void
        {
            this._Str_2156 = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
