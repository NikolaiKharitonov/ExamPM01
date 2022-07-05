package Tests;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import Classes.Auth;
import Classes.Reg;

@RunWith(JUnit4.class)
public class TestReg {
    private Reg mReg;

    @Before
    public void setUp() throws Exception {
        mReg = new Reg("pas1","pas1");
    }

    @Test
    public void TestAuth() throws Exception {

        assertEquals(true, mReg.Registration("pas1","pas1"));

    }

    @After
    public void tearDown() throws Exception {
        mReg= null;
    }
}

