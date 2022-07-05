package Tests;

import static org.junit.Assert.assertEquals;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

import Classes.Auth;

@RunWith(JUnit4.class)
public class TestAuth {
    private Auth mAuth;

    @Before
    public void setUp() throws Exception {
        mAuth = new Auth("Zarry","pswrdZarry");
    }

    @Test
    public void TestAuth() throws Exception {

        assertEquals(true, mAuth.Authorization("Zarry","pswrdZarry"));

    }

    @After
    public void tearDown() throws Exception {
        mAuth = null;
    }
}

