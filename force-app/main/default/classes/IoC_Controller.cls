public class IoC_Controller 
{
	public static IoCInterface GetImplementation(string p_interface)
    {
        string ci_implementation = IoC_Cache_Helper.getImplementation(p_interface);
        Type t = Type.forName(ci_implementation);
        
        if(t == null)
        {
            throw new IoC_InvalidImplementationException();
        }
        
        return (IoCInterface)t.newInstance();    
    }
}