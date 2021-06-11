import  logging
import  sys
# APP_LOGGER_NAME = 'MyAwesomeApp'


def setup_applevel_logger(logger_name=None, file_name=None, log_level=logging.INFO, console=False):
    """Configures logger for logging application events

    Args:
        logger_name (type: str, optional): Name you want to give to your logger. This will be recorded in log output for 
                                        tracking purposes. Defaults to APP_LOGGER_NAME.
        file_name (type: str, optional): file_path/name you want to give to your log file. This should end in .log. 
                                         Defaults to None.
        log_level (type: logging object, optional): logging.INFO, logging.DEBUG, logging.WARNING, logging.ERROR, 
                                                    logging.CRITICAL. Defaults to logging.INFO.
        console (type: boolean, optional): Defaults to False. If True logging results will be printed to the console.

    Returns:
        a log file and/or logs to the cosole
    """
    global APP_LOGGER_NAME
    APP_LOGGER_NAME = logger_name

    logger = logging.getLogger(logger_name)
    logger.setLevel(log_level)
    formatter = logging.Formatter("%(asctime)s - %(name)s - %(levelname)s - %(message)s")
    if console:
        sh = logging.StreamHandler(sys.stdout)
        sh.setFormatter(formatter)
        logger.handlers.clear()
        logger.addHandler(sh)
    if file_name:
        fh = logging.FileHandler(file_name)
        fh.setFormatter(formatter)
        logger.addHandler(fh)
    return logger


def get_logger(module_name):
    """Function to call logger within modules. This will allow logs from multiple packages to be returned in the same file.

    Args:
        module_name (type: str)

    Returns:
        logger from the main module
    """
    return logging.getLogger(APP_LOGGER_NAME).getChild(module_name)