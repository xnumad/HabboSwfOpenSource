package org.openvideoads.vast.config.groupings
{
    import org.openvideoads.base.Debuggable;
    import org.openvideoads.vast.playlist._Str_6835;
    import org.openvideoads.vast.playlist._Str_4575;
    import org.openvideoads.vast.playlist._Str_7812;

    public class ShowsPlaylistConfigGroup extends Debuggable implements _Str_6835 
    {
        protected var _Str_577:String = null;
        protected var _type:int = 5;
        protected var _Str_2519:_Str_4575 = null;

        public function ShowsPlaylistConfigGroup(k:Object)
        {
            if (k.type != undefined)
            {
                this._type = _Str_7812.getType(k.type);
            }
            if (((!(k.url == undefined)) || (!(k.file == undefined))))
            {
                this._Str_577 = ((k.url != undefined) ? k.url : k.file);
                this._Str_24471();
            }
        }

        protected function _Str_24471():void
        {
            if (this._type != -1)
            {
                this._Str_2519 = _Str_7812._Str_19936(this._type);
                this._Str_2519._Str_16925(this._Str_577, this);
            }
        }

        public function _Str_16701(k:_Str_4575):void
        {
        }

        public function set url(k:String):void
        {
            this._Str_577 = k;
        }

        public function get url():String
        {
            return this._Str_577;
        }

        public function set type(k:int):void
        {
            this._type = k;
        }

        public function get type():int
        {
            return this._type;
        }

        public function _Str_10087():Array
        {
            if (this._Str_2519 != null)
            {
                return this._Str_2519._Str_10087();
            }
            return new Array();
        }
    }
}
