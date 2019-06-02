package org.openvideoads.vast.model
{
    import org.openvideoads.regions.view._Str_4027;

    public class _Str_4713 extends NonLinearVideoAd implements _Str_4027 
    {


        public function signalLoadError(k:String):void
        {
        }

        public function get _Str_12737():String
        {
            if (_Str_3937())
            {
                return _Str_3366;
            }
            return _Str_577.getQualifiedStreamAddress();
        }

        override public function get content():String
        {
            return this._Str_12737;
        }

        public function shouldMaintainAspectRatio():Boolean
        {
            return this.maintainAspectRatio;
        }

        public function get recommendedWidth():int
        {
            return _width;
        }

        public function get recommendedHeight():int
        {
            return _height;
        }

        override public function clicked():void
        {
            if (!isInteractive())
            {
                super.clicked();
            }
        }

        override public function close():void
        {
            super.close();
        }
    }
}
