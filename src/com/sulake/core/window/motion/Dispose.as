package com.sulake.core.window.motion
{
    import com.sulake.core.window.IWindow;

    public class Dispose extends Motion 
    {
        public function Dispose(k:IWindow)
        {
            super(k);
        }

        public override function tick(k:int):void
        {
            super.tick(k);
            if (((target) && (!(target.disposed))))
            {
                target.dispose();
                target = null;
            }
        }
    }
}
