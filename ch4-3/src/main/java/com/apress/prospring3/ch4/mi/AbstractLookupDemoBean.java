package com.apress.prospring3.ch4.mi;

public abstract class AbstractLookupDemoBean implements DemoBean {

    public abstract MyHelper getMyHelper();

    public void someOperation() {
        getMyHelper().doSomethingHelpful();
    }

}
