package com.sulake.habbo.help.guidehelp
{
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;

    public class AnimationData 
    {
        public var window:IStaticBitmapWrapperWindow;
        public var asset:String;
        public var _Str_2185:int;

        public function AnimationData(k:IStaticBitmapWrapperWindow, _arg_2:String, _arg_3:int)
        {
            this.window = k;
            this.asset = _arg_2;
            this._Str_2185 = _arg_3;
        }
    }
}
