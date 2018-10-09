package cz.muni.fi.pa165.exception;

import org.springframework.dao.DataAccessException;

/**
 * @author Radovan Lapar
 */
public class PersistenceException extends DataAccessException {

    public PersistenceException(String msg) {
        super(msg);
    }

    public PersistenceException(String msg, Throwable cause) {
        super(msg, cause);
    }
}