package 
{
    import com.sulake.core.runtime.ILogger;

    public class Logger 
    {
        public static var listener:ILogger;


        public static function log(... k):void
        {
			Habbo.trackLoginStep(k as String);
        }
    }
}
