@isTest
public class IoC_Controller_Test 
{
    // currently loading from DB; needs to be moved to Cache
	@isTest
    static void GetImplementation_Test()
    {
        // setup the default interface and implementation
        string p_interface = 'ITestInterface';
        IoC_Object_Helper.createImplementation(p_interface, 'TestImplementation');
        
        // Get the concrete class
        ITestInterface i = (ITestInterface)IoC_Controller.GetImplementation(p_interface);
        system.assertEquals('Hello World', i.HelloWorld());
    }
    
    @isTest
    static void GetImplementation_Change_Test()
    {
        // setup the default interface and implementation
        string p_interface = 'ITestInterface';
        IoC_Object_Helper.createImplementation(p_interface, 'TestImplementation');
        
        // Get the concrete class
        ITestInterface i = (ITestInterface)IoC_Controller.GetImplementation(p_interface);
        system.assertEquals('Hello World', i.HelloWorld());
        
        IoC_Object_Helper.createImplementation(p_interface, 'GermanTestImplementation');
        ITestInterface g = (ITestInterface)IoC_Controller.GetImplementation(p_interface);
        system.assertEquals('Hallo Welt', g.HelloWorld());
    }
    
    @isTest
    static void GetImplementation_NoImplementation_Test()
    {
        // setup the default interface and implementation
        string p_interface = 'ITestInterface';
        
        try
        {
            // Get the concrete class
            ITestInterface i = (ITestInterface)IoC_Controller.GetImplementation(p_interface);  
            
            system.assert(false);
        }
        catch(IoC_NoImplementationException ex)
        {
            system.assert(true);
        }
    }
    
    @isTest
    static void GetImplementation_DudImplementation_Test()
    {
        // setup the default interface and implementation
        string p_interface = 'ITestInterface';
        IoC_Object_Helper.createImplementation(p_interface, 'DudImplementation');
        
        try
        {
            // Get the concrete class
            ITestInterface i = (ITestInterface)IoC_Controller.GetImplementation(p_interface);  

            system.assert(false);
        }
        catch(IoC_InvalidImplementationException ex)
        {
            system.assert(true);
        }
    }
}